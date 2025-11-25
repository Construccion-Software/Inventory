using System.ComponentModel.DataAnnotations;

namespace InventoryService.Domain.Entities;

public class Medicine
{
    public int Id { get; set; }
    [Display(Name = "Nombre")]
    [MaxLength(100, ErrorMessage = "El campo {0} no puede tener mas de {1} carácteres.")]
    [Required(ErrorMessage = "El campo {0} es obligatorio.")]
    public string Name { get; set; } = null!;
    public string Description { get; set; } = string.Empty;
    [Required(ErrorMessage = "El campo {0} es obligatorio.")]
    public string DosageForm { get; set; } = string.Empty;
    [Required(ErrorMessage = "El campo {0} es obligatorio.")]
    public decimal UnitCost { get; set; }
    public int Stock { get; set; }
    public bool Active { get; set; } = true;
}
